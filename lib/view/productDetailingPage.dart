import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cartScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> productData;

  const ProductDetailScreen({Key? key, required this.productData})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isFavorite = false;
  String? _selectedColor; // Variable to store the selected color
  String? _selectedROM; // Variable to store the selected ROM
  String? _userId; // Variable to store the user ID
  final int _quantity = 1; // Variable to store the selected quantity
  bool _isInCart = false; // Variable to store the cart status

  @override
  void initState() {
    super.initState();
    fetchUserId(); // Fetch user ID first
    fetchFavoriteStatus(); // Then fetch favorite status
    checkIfInCart(); // Check if the item is in the cart
  }

  // Function to fetch favorite status from Firestore
  Future<void> fetchFavoriteStatus() async {
    try {
      if (_userId != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('favorites')
            .doc(_userId)
            .collection('userFavorites')
            .doc(widget.productData['pid'])
            .get();

        setState(() {
          _isFavorite = snapshot.exists;
        });
      }
    } catch (error) {
      print('Error fetching favorite status: $error');
      setState(() {
        _isFavorite = false;
      });
    }
  }

  // Function to fetch the current user ID
  Future<void> fetchUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    }
  }

  // Function to check if the item is already in the cart
  Future<void> checkIfInCart() async {
    try {
      if (_userId != null) {
        QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection('cart')
            .where('pid', isEqualTo: widget.productData['pid'])
            .where('userId', isEqualTo: _userId)
            .get();

        setState(() {
          _isInCart = cartSnapshot.docs.isNotEmpty;
        });
      }
    } catch (error) {
      print('Error checking cart status: $error');
    }
  }

  Future<void> addToFavorites() async {
    try {
      if (_userId == null) {
        // Handle the case where the user ID is not available
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not logged in'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      // Add the product to favorites collection
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(_userId)
          .collection('userFavorites')
          .doc(widget.productData['pid'])
          .set({
        'userId': _userId, // Save user ID
        'timestamp': FieldValue.serverTimestamp(),
      });
      print(' *********************************');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item added to favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error adding item to favorites: *********************************$error');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add item to favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Function to remove the product from favorites
  Future<void> removeFromFavorites() async {
    try {
      if (_userId == null) {
        // Handle the case where the user ID is not available
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not logged in'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      // Remove the product from favorites collection
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(_userId)
          .collection('userFavorites')
          .doc(widget.productData['pid'])
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item removed from favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print('Error removing item from favorites: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to remove item from favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.productData['brand'] ?? ''} '),
      ),
      body: Padding(
        padding:  EdgeInsets.all(18.0.r),
        child: ListView(
          children: [
            // Display product image
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              color: Colors.white,
              child: Image.network(
                widget.productData['image'] ?? '',
                width: MediaQuery.of(context).size.width,
                height: 500.h,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 15.h),
            // Display product details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.productData['productName'] ?? ''}',
                  style:  TextStyle(fontSize: 24.r, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () async {
                    if (_isFavorite) {
                      await removeFromFavorites();
                    } else {
                      await addToFavorites();
                    }
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              'Price: Rs ${widget.productData['price'] ?? ''}',
              style: TextStyle(fontSize: 18.r),
            ),
            SizedBox(height: 10.h),
            const Text('Color:'),
            Wrap(
              spacing: 5.w,
              children: (widget.productData['color'] as List<dynamic> ?? [])
                  .map<Widget>((color) {
                return Material(
                  borderRadius: BorderRadius.circular(20.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      setState(() {
                        _selectedColor = color.toString(); // Set selected color
                      });
                    },
                    child: Chip(
                      label: Text(
                        color.toString(),
                      ),
                      backgroundColor: _selectedColor == color.toString()
                          ? Colors.green.shade200
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 5.h),
            Text('RAM: ${widget.productData['ram'] ?? ''}'),
            SizedBox(height: 10.h),
            const Text('ROM: '),
            Wrap(
              spacing: 5.w,
              children: (widget.productData['ROM'] as List<dynamic> ?? [])
                  .map<Widget>((rom) {
                return Material(
                  borderRadius: BorderRadius.circular(20.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      setState(() {
                        _selectedROM = rom.toString(); // Set selected ROM
                      });
                    },
                    child: Chip(
                      label: Text(
                        rom.toString(),
                      ),
                      backgroundColor: _selectedROM == rom.toString()
                          ? Colors.green.shade200
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 5.h),
            Text(
              'Description: ${widget.productData['description'] ?? ''}',
              style: TextStyle(
                fontSize: 14.r,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 120.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                    ),
                    onPressed: () async {
                      if (_selectedColor == null || _selectedROM == null) {
                        // Show alert if no color or ROM is selected
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Mandatory Selection'),
                            content: const Text('Please select both a color and ROM before placing your order.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else if (_isInCart) {
                        // If the item is already in the cart, navigate to the cart screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CartSample(productData: widget.productData)),
                        );
                      } else {
                        // If the item is not in the cart, add it to the cart
                        await addToCart();
                      }
                    },
                    child: Text(_isInCart ? 'Go to Cart' : 'Add to Cart'),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addToCart() async {
    try {
      if (_userId == null) {
        // Handle the case where the user ID is not available
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not logged in'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('cart').add({
        'pid': widget.productData['pid'],
        'brand': widget.productData['brand'],
        'productName': widget.productData['productName'],
        'price': widget.productData['price'],
        'color': _selectedColor,
        'ROM': _selectedROM,
        'userId': _userId,
        'quantity': _quantity,
        'image': widget.productData['image'],
      });

      // Update the cart status and navigate to the cart screen
      setState(() {
        _isInCart = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartSample(productData: widget.productData)),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to cart'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print('Error adding item to cart: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add item to cart'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
