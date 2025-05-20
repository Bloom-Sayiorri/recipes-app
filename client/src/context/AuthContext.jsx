import { createContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

export const AuthContext = createContext();

export default function AuthProvider({ children }) {
	const navigate = useNavigate();

	const [currentUser, setCurrentUser] = useState("");

	const login = () => {
		fetch("/login", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
				Authorization: "Bearer <token>",
			},
			body: JSON.stringify({
				// username: username,
				// password: password,
			}),
		})
			.then((res) => res.json())
			// .then((data) => {
			//     localStorage.setItem('jwt', data.jwt);
			// })
			.then((res) => {
				if (res.ok) {
					console.log(res);
				}
			});
		console.log("context from login");
	};

	const signup = () => {
		console.log("context from signup");
	};

	const logout = () => {
		fetch("/user", {
			method: "DELETE",
		}).then(localStorage.removeIem("jwt"));
	};

	useEffect(() => {
		console.log("This is my useEffect function.");
	}, []);

	const contextData = { login, signup, logout };

	return (
		<>
			<AuthContext.Provider value={contextData}>
				{children}
			</AuthContext.Provider>
		</>
	);
}
