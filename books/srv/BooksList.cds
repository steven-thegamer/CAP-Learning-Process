using { sap.capire.books as db } from '../db/schema';

service BooksList {
    entity Books as projection on db.Books;
    entity Categories as projection on db.Categories;
    entity Authors as projection on db.Authors;
}