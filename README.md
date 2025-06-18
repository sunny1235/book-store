# book_store

A Flutter application that allows users to browse books, mark favorites, and view only their favorite books.

- Features :
  Book listing with title, author, and cover image
  Mark/unmark books as favorites
  Real-time search functionality
  Favorites screen with only favorite books
  Persistent favorites using SharedPreferences


- Architecture & Tech :
Clean Architecture (Data → Domain → Presentation)
Bloc for state management
Dependency Injection using get_it


- Unit tests for usecases :
GetBooksUseCase

- Notes :
Data is mocked using local JSON (simulates network call)
