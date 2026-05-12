import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';

class TaskFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // Get current user ID
  String? get _userId => _auth.currentUser?.uid;

  // Get tasks collection reference
  CollectionReference<Map<String, dynamic>> get _tasksCollection =>
      _firestore.collection('tasks');

  // Save task to Firebase
  Future<void> saveTask(TaskModel task) async {
    if (_userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      final data = task.toJson()..['userId'] = _userId;
      await _tasksCollection.add(data);
      print('save task is successfully completed');
    } catch (e) {
      throw Exception('Failed to save task: $e');
    }
  }

  // Get all tasks for current user
  Future<List<TaskModel>> getAllTasks() async {
    if (_userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      final snapshot = await _tasksCollection
          .where('userId', isEqualTo: _userId)
          .get();
      return snapshot.docs
          .map((doc) => TaskModel.fromJson(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  // Stream of tasks (real-time updates)
  Stream<List<TaskModel>> getTasksStream() {
    if (_userId == null) {
      return const Stream.empty();
    }

    return _tasksCollection
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TaskModel.fromJson(doc.data(), doc.id))
              .toList(),
        );
  }

  // Update task
  Future<void> updateTask(TaskModel task) async {
    if (_userId == null || task.id == null) {
      throw Exception('User not authenticated or task ID missing');
    }

    try {
      await _tasksCollection.doc(task.id).update(task.toJson());
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    if (_userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      await _tasksCollection.doc(taskId).delete();
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  // Toggle task completion
  Future<void> toggleTaskCompletion(String taskId, bool isCompleted) async {
    if (_userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      await _tasksCollection.doc(taskId).update({
        'completed': isCompleted,
        'completedDate': isCompleted ? DateTime.now() : null,
      });
    } catch (e) {
      throw Exception('Failed to toggle task: $e');
    }
  }
}
