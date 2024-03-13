import 'package:mobicom/models/chapter.dart';

String getRandomImage() {
  String baseUrl = 'https://source.unsplash.com/random/';
  String imageSize = '800x600';
  return '$baseUrl$imageSize';
}



List<Chapter> sample_chapters = [
  Chapter(
    id: 1,
    title: "Chapter 1",
    description: "Description for Chapter 1",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+1",
    created_at: "2024-03-13",
    updated_At: "2024-03-13",
    number: 1,
  ),
  Chapter(
    id: 2,
    title: "Chapter 2",
    description: "Description for Chapter 2",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+2",
    created_at: "2024-03-14",
    updated_At: "2024-03-14",
    number: 2,
  ),
  Chapter(
    id: 3,
    title: "Chapter 3",
    description: "Description for Chapter 3",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+3",
    created_at: "2024-03-15",
    updated_At: "2024-03-15",
    number: 3,
  ),
  Chapter(
    id: 4,
    title: "Chapter 4",
    description: "Description for Chapter 4",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+4",
    created_at: "2024-03-16",
    updated_At: "2024-03-16",
    number: 4,
  ),
  Chapter(
    id: 5,
    title: "Chapter 5",
    description: "Description for Chapter 5",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+5",
    created_at: "2024-03-17",
    updated_At: "2024-03-17",
    number: 5,
  ),
  Chapter(
    id: 6,
    title: "Chapter 6",
    description: "Description for Chapter 6",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+6",
    created_at: "2024-03-18",
    updated_At: "2024-03-18",
    number: 6,
  ),
  Chapter(
    id: 7,
    title: "Chapter 7",
    description: "Description for Chapter 7",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+7",
    created_at: "2024-03-19",
    updated_At: "2024-03-19",
    number: 7,
  ),
  Chapter(
    id: 8,
    title: "Chapter 8",
    description: "Description for Chapter 8",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+8",
    created_at: "2024-03-20",
    updated_At: "2024-03-20",
    number: 8,
  ),
  Chapter(
    id: 9,
    title: "Chapter 9",
    description: "Description for Chapter 9",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+9",
    created_at: "2024-03-21",
    updated_At: "2024-03-21",
    number: 9,
  ),
  Chapter(
    id: 10,
    title: "Chapter 10",
    description: "Description for Chapter 10",
    image_path: "https://via.placeholder.com/300x200.png?text=Chapter+10",
    created_at: "2024-03-22",
    updated_At: "2024-03-22",
    number: 10,
  ),
];
