import 'package:get/get.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';

class ChapterListWidgetController extends GetxController{

  RxBool isExpanded = false.obs;
  RxBool isHovered = false.obs;
  // RxInt isExpanded = (-1).obs;


  // SubjectData chapterList = SubjectData(
  //     chapters: [
  //   ChapterData(
  //     name: 'Introduction to Flutter',
  //     topics: [
  //       TopicData(
  //         topicName: 'Setting Up Flutter Environment',
  //         mediaCount: 5,
  //         eMaterialCount: 3,
  //         questionsCount: 10,
  //         quizCount: 1,
  //         isCompleted: true,
  //         completedDate: "21/02/2022",
  //       ),
  //       TopicData(
  //         topicName: 'Creating Your First Flutter App',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: true,
  //         completedDate: "21/02/2022",
  //       ),
  //       TopicData(
  //         topicName: 'Your First Hello World Code',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //       TopicData(
  //         topicName: 'Building Your First Apk',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //     ],
  //   ),
  //   ChapterData(
  //     name: 'Flutter Widgets',
  //     topics: [
  //       TopicData(
  //         topicName: 'Introduction to Widgets',
  //         mediaCount: 5,
  //         eMaterialCount: 3,
  //         questionsCount: 10,
  //         quizCount: 1,
  //         isCompleted: false,
  //       ),
  //       TopicData(
  //         topicName: 'Stateless Widgets',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: true,
  //         completedDate: "21/02/2022",
  //
  //       ),
  //       TopicData(
  //         topicName: 'Stateful Widgets',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //     ],
  //   ),
  //   ChapterData(
  //     name: 'Flutter Layouts',
  //     topics: [
  //       TopicData(
  //         topicName: 'Introduction to Layouts',
  //         mediaCount: 5,
  //         eMaterialCount: 3,
  //         questionsCount: 10,
  //         quizCount: 1,
  //         isCompleted: false,
  //       ),
  //       TopicData(
  //         topicName: 'Row and Column',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //       TopicData(
  //         topicName: 'Stack and Positioned',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: true,
  //         completedDate: "21/02/2022",
  //
  //       ),
  //     ],
  //   ),
  //   ChapterData(
  //     name: 'Flutter State Management',
  //     topics: [
  //       TopicData(
  //         topicName: 'Introduction to State Management',
  //         mediaCount: 5,
  //         eMaterialCount: 3,
  //         questionsCount: 10,
  //         quizCount: 1,
  //         isCompleted: true,
  //         completedDate: "21/02/2022",
  //
  //       ),
  //       TopicData(
  //         topicName: 'Provider Package',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //       TopicData(
  //         topicName: 'Bloc Pattern',
  //         mediaCount: 8,
  //         eMaterialCount: 2,
  //         questionsCount: 15,
  //         quizCount: 2,
  //         isCompleted: false,
  //       ),
  //     ],
  //   ),
  // ]);

}