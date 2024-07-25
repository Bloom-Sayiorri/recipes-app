// import { createContext } from 'react';

// export const AuthContext = createContext();

// export default function AuthProvider({children}) {

//     const login = () => {
//         console.log('context from login');
//     };
//     const signup = () => {
//         console.log('context from signup');
//     };
//     const logout = () => {
//         console.log('context from logout');
//     };

//     const contextData= { login, signup, logout };

//     return (
//         <>
//             <AuthContext.Provider value={contextData}>
//                 {children}
//             </AuthContext.Provider>
//         </>
//     )
// }