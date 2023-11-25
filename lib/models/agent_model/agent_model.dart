import 'package:cloud_firestore/cloud_firestore.dart';

class AgentModel {
  final String? id;
  final String agentId;
  final String name;
  final String phone;
  final String email;
  final String aadhar;
  final String pan;
  final String address;

  AgentModel({
    this.id,
    required this.agentId,
    required this.name,
    required this.phone,
    required this.email,
    required this.aadhar,
    required this.pan,
    required this.address,
  });

  toJson() {
    return {
      "AgentId": agentId,
      "Name": name,
      "Phone": phone,
      "Email": email,
      "Aadhar": aadhar,
      "Pan": pan,
      "Address": address,
    };
  }

  factory AgentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return AgentModel(
      id: document.id,
      name: data['name'],
      phone: data['phone'],
      email: data['Email'],
      aadhar: data['aadhar'],
      pan: data['pan'],
      address: data['address'],
      agentId: '',
    );
  }
}
