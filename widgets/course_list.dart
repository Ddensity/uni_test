import 'package:flutter/material.dart';
import 'package:uni_test/constants/constant.dart';
import 'package:uni_test/Helper/helper.dart';
import 'package:uni_test/Model/model.dart';

class CourseList extends StatelessWidget {
  final Function onDismiss;
  const CourseList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> allCourses = DataHelper.allAddedCourses;
    return allCourses.isNotEmpty
        ? ListView.builder(
            itemCount: allCourses.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allCourses[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor.shade500,
                        child: Text((allCourses[index].letterValue *
                                allCourses[index].creditValue)
                            .toStringAsFixed(1)),
                      ),
                      subtitle: Text(
                          '${allCourses[index].creditValue} Credit, Grade Value ${allCourses[index].letterValue}'),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              'Add course',
              style: Constants.gradecalcStyle,
            ));
  }
}