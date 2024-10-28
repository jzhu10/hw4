# hw4

Using GoRouter and AuthenticationBloc to implement Book Club App pages

## Features
- In 'Sorted by Author' and 'Sorted by Title' pages, the books are sorted accordingly.
- The book's details are displayed based on the selected entry in the book list.

## Implementing Details
- The bookList content is generated in lib/repository/book.dart using lorem.
- The GoRouter logic is in navigation/bookclub_router.dart. An index path parameter is used in GoRouter setup (in byAuthor and byTitle routes) to allow navigating to a specific page that displays detailed information about a selected book based on its index in bookList.
- The book sorting logic is in widgets/scaffold_with_nav_bar.dart _onItemTapped() function. It is called before direct to target sorted pages.



