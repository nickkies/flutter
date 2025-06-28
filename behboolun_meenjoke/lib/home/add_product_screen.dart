import 'dart:typed_data';

import 'package:behboolun_meenjoke/camera_example_page.dart';
import 'package:behboolun_meenjoke/model/category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSale = false;

  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Uint8List? imageData;
  XFile? image;

  Category? selectedCategory;

  TextEditingController titleTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  TextEditingController priceTEC = TextEditingController();
  TextEditingController stockTEC = TextEditingController();
  TextEditingController salePercentTEC = TextEditingController();

  List<Category> categories = [];
  void _fetchCategories() async {
    final res = await db.collection('category').get();
    for (var doc in res.docs) {
      // categories.add(Category(docId: doc.id, title: doc.data()['title']));
      categories.add(Category.fromJson(doc.data()));
    }
    setState(() {
      selectedCategory = categories.first;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '필수 입력 항목입니다.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 추가'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CameraExamplePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.batch_prediction),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  image = await picker.pickImage(source: ImageSource.gallery);
                  imageData = await image?.readAsBytes();
                  setState(() {});
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: imageData == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 50),
                              Text('제품(상품) 이미지 추가'),
                            ],
                          )
                        : Image.memory(imageData!, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '기본정보',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Form(
                key: _formKey,
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    TextFormField(
                      controller: titleTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '상품명',
                        hintText: '제품명을 입력하세요.',
                      ),
                      validator: _requiredValidator,
                    ),
                    TextFormField(
                      controller: descriptionTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '상품 설명',
                      ),
                      maxLength: 254,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: _requiredValidator,
                    ),
                    TextFormField(
                      controller: priceTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '가격(단가)',
                        hintText: '1개 가격 입력',
                      ),
                      keyboardType: TextInputType.number,
                      validator: _requiredValidator,
                    ),
                    TextFormField(
                      controller: stockTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '수량',
                        hintText: '입고 및 재고 수량',
                      ),
                      keyboardType: TextInputType.number,
                      validator: _requiredValidator,
                    ),
                    SwitchListTile.adaptive(
                      value: isSale,
                      title: const Text('할인여부'),
                      onChanged: (value) => setState(() => isSale = value),
                    ),
                    if (isSale)
                      TextFormField(
                        controller: salePercentTEC,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '할인율',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          return null;
                        },
                      ),
                    const Text(
                      '카테고리 선택',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    categories.isNotEmpty
                        ? DropdownButton<Category>(
                            isExpanded: true,
                            value: selectedCategory,
                            items: categories
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('${e.title}'),
                                  ),
                                )
                                .toList(),
                            onChanged: (s) =>
                                setState(() => selectedCategory = s),
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
