namespace sap.capire.library;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

entity Books : cuid, managed {
    title    : localized String(111);
    descr    : localized String(1111);
    author  : Association to Authors;
    available    : Boolean;
    category : Association to Categories;
}

entity Categories : CodeList {
    key ID   : Integer;
    parent   : Association to Categories;
    children : Composition of many Categories on children.parent = $self;
}

entity Authors : cuid, managed {
    name     : localized String(111);
    gender  : String(1);
    books    : Composition of many Books on books.author = $self;
}