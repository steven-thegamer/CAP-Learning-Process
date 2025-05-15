service BooksList {
    entity Books {
        key ID : UUID;
        title  : String(111);
        author  : String(1111);
        desc    : String(1111);
        category    : String(111);
        available   : Boolean;
    }
}