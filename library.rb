class Library

  def initialize
    @books = []
    @shelves = []
  end

  def add_book(name)
    @books << Book.new(name)
  end

  def add_shelf(name)
    @shelves << Shelf.new(name)
  end

  def book_list
    @books.each do |book|
      puts book.name
    end
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


  class Book
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
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

end


my_lib = Library.new

my_lib.add_shelf("Childrens")
my_lib.add_shelf("Adult")
my_lib.add_shelf("Young Adults")

my_lib.add_book("Lord of the Flies")
my_lib.add_book("The Da Vinci Code")
my_lib.add_book("The Little Engine That Could")

my_lib.shelf_report
my_lib.book_list

