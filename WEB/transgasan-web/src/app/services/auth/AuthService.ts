import { ApiResponse } from "../../interfaces/response/ApiResponse";
import { User } from "../../interfaces/user/User";
import { fasicellService } from "../FasicellService";

export class AuthService{

   public static async login(obj:User):Promise<ApiResponse>{
    return (await fasicellService.post('/login', obj)).data
   }
}