book_height = 101;
book_width = 101;
book_depth = 5;
number_of_books = 13;
book_padding = 2;
padding = 5;

module book() { cube([book_width, book_depth, book_height]);}

module storage() {cube([book_width + 2*padding, 2*padding + number_of_books*(book_depth + book_padding) - book_padding, book_height /2 + padding]);}

module all_books() {
    union() {
    translate([padding, padding, padding])
        book();
    
    for(i = [1: 1: number_of_books-1]) {
        translate([padding, padding + i*(book_depth+book_padding), padding])
            book();
        };
    };
}

difference() {
    storage();
    
    all_books();
}