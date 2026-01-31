//Create a class called Book with properties like title, author, and publication year. Addmethods to display
// the book’s details and a methodto check if it’s over 10 years old.

class Book {
  String title;
  String author;
  int publicationYear;

  Book(this.title, this.author, this.publicationYear);

  void display() {
    print("\nTitle: $title");
    print("Author: $author");
    print("Publication Year: $publicationYear");
  }

  void checkAge() {
    int currentYear = DateTime.now().year;
    if (currentYear - publicationYear > 10) {
      print("Yes, this book is more than 10 years old.");
    } else {
      print("No, this book is not 10 years old yet.");
    }
  }
}

void main() {
  Book b = Book("The Jungle Book", "J.K. Rowling", 1975);
  b.display();
  b.checkAge();
}
