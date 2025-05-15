namespace sap.capire.books;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

type Gender : String(2) enum {  male = 'm';
                                female = 'f'; 
                                non_binary = 'nb'; }

entity Books : managed {
    key ID      : Integer not null;
    title    : localized String(111) not null;
    descr    : localized String(1111);
    author   : Association to Authors not null;
    category : Association to Categories not null;
}

entity Categories : CodeList {
    key id   : Integer not null;
    parent   : Association to Categories;
    children : Composition of many Categories on children.parent = $self;
}

entity Authors : cuid, managed {
    name     : localized String(111) not null;
    gender   : Gender not null;
    books    : Composition of many Books on books.author = $self;
}

