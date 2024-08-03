using {
  Currency,
  managed,
  sap
} from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {
  key ID                : Integer;
      @mandatory title  : localized String(111);
      descr             : localized String(1111);
      @mandatory author : Association to Authors;
      genre             : Association to Genres;
      stock             : Integer;
      price             : Decimal;
      currency          : Currency;
      image             : LargeBinary @Core.MediaType: 'image/png';
}

entity Authors : managed {
  key ID              : Integer;
      @mandatory name : String(111);
      dateOfBirth     : Date;
      dateOfDeath     : Date;
      placeOfBirth    : String;
      placeOfDeath    : String;
      books           : Association to many Books
                          on books.author = $self;
}

/** Hierarchically organized Code List for Genres */
entity Genres : sap.common.CodeList {
  key ID       : Integer;
      parent   : Association to Genres;
      children : Composition of many Genres
                   on children.parent = $self;
}


type LText : String(1024);
type SText : String(512);

entity BaseEntity {
  key ID        : UUID;
      createdAt : Timestamp  @cds.on.insert: $now;
      updatedAt : Timestamp  @cds.on.insert: $now  @cds.on.update: $now;
      deletedAt : Timestamp;

}

entity Products : BaseEntity {
  Name        : SText;
  Description : LText;
  Price       : Decimal(10, 2);

}

entity Categories : BaseEntity {
  Name        : SText;
  Description : LText;
  Products    : Composition of many Products
                  on Products.ID

}

entity User : BaseEntity {
  FullName : LText;

}
