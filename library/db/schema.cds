namespace sap.capire.library;

using { cuid, managed } from '@sap/cds/common';
using { sap.capire.books.Books, sap.capire.books.Gender } from '@sap/capire-books';

type BorrowStatus : String(20) enum {  borrowed = 'borrowed';
                                        returned = 'returned'; }

entity AvailableBooks as projection on Books; extend Books with {
    borrowed_status : Association to BooksTransaction;
}

entity Users : managed {
    key user_id : Integer not null;
    name     : localized String(111);
    gender   : Gender;
    email    : String(111);
    transaction_history : Association to many BooksTransaction on transaction_history.user_id = $self;
}

entity BooksTransaction : cuid, managed {
    book_id   : Composition of many AvailableBooks on book_id.borrowed_status = $self;
    user_id   : Composition of Users not null;
    borrow_date: DateTime;
    return_date: DateTime;
    status     : BorrowStatus default 'borrowed';
}