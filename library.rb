class Library
  attr_accessor :book, :shelf

  def initialize
    @books = []
    @shelves = []
  end

  def add_book(name)
    @book = Book.new(name)
    @books << @book
    return @book
  end

  def add_shelf(name)
    @shelf = Shelf.new(name)
    @shelves << @shelf
    return @shelf
  end

  def book_list
    @books.each do |book|
      puts book.name
    end
  end

  def self.update_shelf(lib, book,shelf)
    puts lib.shelves
    to_update = @shelves.select { |x| x.name == shelf }
    update_index = @shelves.index(to_update)
    to_update.shelved_books << book.name
    @shelves[update_index] = to_update 
  end

  def shelf_report
    if @shelves.length > 1
      puts "There are #{@shelves.length} shelves in the library"
    elsif @shelves.length == 1
      puts "There is 1 shelf in the library"
    else
      puts "There are no shelves in the library currently"
    end
  end


  class Book < Library
    attr_accessor :name, :shelf

    def initialize(name)
      @name = name
      @shelf = nil
    end

    def enshelf(shelf)
      @shelf = shelf
    end

    def unshelf
      @shelf = nil
    end
  end

  class Shelf
    attr_accessor :name, :shelved_books

    def initialize(name)
      @name = name
      @shelved_books = []
    end

    def update_add(book)
      @shelved_books << book.name
    end

    def update_remove(book)
      @shelved_books.delete_if { |x| x == book.name }
    end
  end

end


my_lib = Library.new

shelf1 = my_lib.add_shelf("Childrens")
shelf2 = my_lib.add_shelf("Adult")
shelf3 = my_lib.add_shelf("Young Adult")

my_book = my_lib.add_book("Lord of the Flies")
book2 = my_lib.add_book("The Da Vinci Code")
book3 = my_lib.add_book("The Little Engine That Could")

my_lib.shelf_report
my_lib.book_list

my_book.enshelf("Young Adult")
book2.enshelf("Adult")
book3.enshelf("Childrens")
shelf3.update_add(my_book)
puts "Book on #{shelf3.name}, #{shelf3.shelved_books.to_s}"
my_book.unshelf
shelf3.update_remove(my_book)
puts "Book on #{shelf3.name}, #{shelf3.shelved_books.to_s}"
#suboptimal, return if you have time
