package stylish.ejb;

import java.util.List;
import javax.ejb.Local;
import stylish.entity.UserAddresses;
import stylish.entity.Users;
import stylish.entity.WishList;

@Local
public interface UsersStateLessBeanLocal {

    List<Users> getAllUsers();

    Users findUserByEmail(String email);

    int addUsers(Users users, String phone, String address); //kiểu trả vẻ: int hoặc string. nếu dùng int: int error_code; nếu error_code = 1 => insert thành công, error_code = 2 => username này bị trùng, error_code = 0=> có lỗi xãy ra

    Users getUserByID(int userID);

    void addUserAddress(UserAddresses newUserAddress);

    boolean updateStatusUser(int userID, short status);

    int updateUser(Users user);

    int login(String email, String pass);

    int checkLoginUser(String email, String pass);

    void changePass(int userID, String newpass);

    List<Users> getAllUserID(int userID);

    List<Users> getAllEmail();

    int addWishlist(WishList wishList, int userID, int productID);

    List<WishList> getAllWishList(int userID);

    void deleteWishLish(int wishID);

    WishList findWishID(int wishID);

    WishList findWishProductID(int productID, int userID);

    void deleteWL(int productID, int userID);
}
