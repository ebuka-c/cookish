import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  List<Map<String, dynamic>> dishes = []; // To store the fetched data
  bool isLoading = true; // To track loading state

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Fetch data from Firestore
  Future<void> fetchData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('hausa').get();
      final fetchedDishes = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      setState(() {
        dishes = fetchedDishes;
        isLoading = false; // Data has been fetched
      });
    } catch (error) {
      setState(() {
        isLoading = false; // Stop loading on error
      });
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore Example")),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator()) // Show loader while loading
          : dishes.isEmpty
              ? Center(child: Text("No data available"))
              : ListView.builder(
                  itemCount: dishes.length,
                  itemBuilder: (context, index) {
                    final dish = dishes[index];
                    return ListTile(
                      title: Text(dish['name'] ?? 'No Name'),
                      leading: Image.network(
                        dish['imageURL'] ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
    );
  }
}
