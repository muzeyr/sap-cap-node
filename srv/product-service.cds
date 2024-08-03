namespace app.ecommerce.service;

using {sap.capire.bookshop as db} from '../db/schema';


service ProductService {

     @readonly
     entity Products   as projection on db.Products;

     @readonly
     entity Categories as
          projection on db.Categories {
               key ID,
                   Name,
                   Description,

          };

     @readonly
     entity User       as projection on db.User;
}
