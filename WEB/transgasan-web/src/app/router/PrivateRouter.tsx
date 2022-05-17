import { Route, Navigate } from "react-router-dom";

interface Props {
   loggedIn:boolean | undefined,
   element:JSX.Element
}

export function PrivateRouter({ loggedIn, element }:Props){
 return (
    <>
      {
         loggedIn ? (
               element
         ): (
            <Navigate to='/auth/login' />
         )
      }
    </>
 );
}