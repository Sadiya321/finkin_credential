import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/agent_model/agent_model.dart';

class AgentRepository extends GetxController {
  static AgentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createAgent(AgentModel agent) async {
    await _db
        .collection("Agents")
        .add(agent.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "your form has been recorded",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    });
  }

  Future<AgentModel> getAgentDetails(String email) async {
    final snapshot =
        await _db.collection("Agents").where("Email", isEqualTo: email).get();
    final agentData =
        snapshot.docs.map((e) => AgentModel.fromSnapshot(e)).single;
    return agentData;
  }

  Future<List<AgentModel>> allAgent() async {
    final snapshot = await _db.collection("Agents").get();
    final agentData =
        snapshot.docs.map((e) => AgentModel.fromSnapshot(e)).toList();
    return agentData;
  }
}
