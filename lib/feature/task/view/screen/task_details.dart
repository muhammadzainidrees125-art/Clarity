import 'dart:async';
import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskDetails extends StatefulWidget {
  final TaskModel task;
  final int taskIndex;
  const TaskDetails({super.key, required this.task, required this.taskIndex});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  Timer? _timer;
  Duration _duration = Duration.zero;
  int _pendingSeconds = 0;
  bool _isRunning = false;
  bool _taskSaved = false;

  int get _totalTrackedSeconds =>
      (widget.task.focusTimeMinutes * 60) + _duration.inSeconds;

  String get _formattedTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(_totalTrackedSeconds ~/ 3600);
    final minutes = twoDigits((_totalTrackedSeconds % 3600) ~/ 60);
    final seconds = twoDigits(_totalTrackedSeconds % 60);
    return '$hours:$minutes:$seconds';
  }

  String get _statusText {
    if (widget.task.completed) return 'Completed';
    if (_isRunning || widget.task.focusTimeMinutes > 0) return 'In Progress';
    return 'Pending';
  }

  Color get _statusColor {
    if (widget.task.completed) return Color(0xffD3E4FE);
    if (_isRunning || widget.task.focusTimeMinutes > 0)
      return Color(0xffD3E4FE);
    return Color(0xffFFE5E5);
  }

  Future<void> _syncPendingFocusTime() async {
    if (_pendingSeconds < 300) return;

    final blocks = _pendingSeconds ~/ 300;
    final minutesToSave = blocks * 5;
    _pendingSeconds -= blocks * 300;

    final cubit = context.read<AddTaskCubit>();
    try {
      await cubit.updateFocusTime(widget.taskIndex, minutesToSave);
      setState(() {
        widget.task.focusTimeMinutes += minutesToSave;
      });
    } catch (e) {
      print('Error syncing focus time: $e');
    }
  }

  void _startTimer() {
    if (_timer != null) return;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration += Duration(seconds: 1);
        _pendingSeconds += 1;
      });
      if (_pendingSeconds >= 300) {
        _syncPendingFocusTime();
      }
    });
    setState(() {
      _isRunning = true;
    });
  }

  Future<void> _pauseTimer() async {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _isRunning = false;
    });
    await _syncPendingFocusTime();
  }

  Future<void> _stopTimer() async {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _duration = Duration.zero;
      _isRunning = false;
    });
    await _syncPendingFocusTime();
  }

  Future<void> _saveTask() async {
    final cubit = context.read<AddTaskCubit>();
    await _pauseTimer();
    setState(() {
      _taskSaved = true;
      widget.task.completed = true;
    });
    cubit.completeTask(widget.taskIndex);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _syncPendingFocusTime();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Clarity',
          style: TextTheme.of(
            context,
          ).titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight(700)),
        ),
      ),
      backgroundColor: Color(0xfff1F5F9),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 24,
                    width: 94,
                    decoration: BoxDecoration(
                      color: _statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        _statusText,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.task.taskTitle ?? '',
                    style: TextTheme.of(context).headlineLarge,
                  ),
                  Text(widget.task.description ?? ''),
                ],
              ),
            ),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xff004AC6),
                      ),
                      Column(
                        children: [
                          Text(
                            'DUE DATE',
                            style: TextTheme.of(context).labelSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight(600),
                            ),
                          ),
                          Text(
                            widget.task.dueDate ?? '',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight(700),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(height: 1, width: 316, color: Color(0xffC3C6D7)),
                  SizedBox(height: 20),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.error_outline, color: Color(0xffBA1A1A)),
                      Column(
                        children: [
                          Text(
                            'PRIORITY',
                            style: TextTheme.of(context).labelSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight(600),
                            ),
                          ),
                          Text(
                            widget.task.priorityLevel ?? 'Medium',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  color: Color(0xffBA1A1A),
                                  fontSize: 20,
                                  fontWeight: FontWeight(700),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomContainer(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('TAGS'),
                  Row(
                    spacing: 7,
                    children: (widget.task.tags ?? []).map((tag) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        height: 32,
                        width: 82,
                        decoration: BoxDecoration(
                          color: Color(0xffDBE1FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight(600),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            CustomContainer(
              color: Color(0xff2563EB),
              child: Column(
                spacing: 5,
                children: [
                  Text(
                    'TIME TRACKED',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                  Text(
                    _formattedTime,
                    style: TextTheme.of(context).displayLarge?.copyWith(
                      fontSize: 64,
                      fontWeight: FontWeight(800),
                      color: Color(0xffffffff),
                    ),
                  ),
                  if (_taskSaved || widget.task.completed)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Task Saved',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 25,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color(
                                    0xffFFFFFF,
                                  ).withValues(alpha: 0.20),
                                  shape: CircleBorder(),
                                ),
                                onPressed: _stopTimer,
                                icon: Icon(
                                  Icons.crop_square_sharp,
                                  size: 30,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 72,
                              height: 72,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _isRunning
                                      ? Color(0xff2563EB)
                                      : Color(0xffffffff),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: _isRunning
                                      ? _pauseTimer
                                      : _startTimer,
                                  icon: Icon(
                                    _isRunning ? Icons.pause : Icons.play_arrow,
                                    size: 40,
                                  ),
                                  color: _isRunning
                                      ? Color(0xffffffff)
                                      : Color(0xff2563EB),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color(
                                    0xffFFFFFF,
                                  ).withValues(alpha: 0.20),
                                  shape: CircleBorder(),
                                ),
                                onPressed: _saveTask,
                                icon: Icon(
                                  Icons.save,
                                  size: 30,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
