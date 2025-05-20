import React, { useState } from "react";

const Signup = () => {
	const [formData, setFormData] = useState({
		username: "",
		email: "",
		password: "",
	});

	const handleSubmit = (event) => {
		event.preventDefault();
	};

	const handleChange = (event) => {
		setFormData(event.target.value);
	};

	return (
		<div className="">
			<form onSubmit={handleSubmit}>
				<label htmlFor="username" className="">
					Username
				</label>
				<input
					type="username"
					id="username"
					name="username"
					placeholder="Enter your username..."
					value={formData.username}
					onChange={handleChange}
					className=""
				/>
				<label htmlFor="email" className="">
					Email
				</label>
				<input
					type="email"
					id="email"
					name="email"
					placeholder="Enter your email..."
					value={formData.email}
					onChange={handleChange}
					className=""
				/>
				<label htmlFor="password" className="">
					Password
				</label>
				<input
					type="password"
					id="password"
					name="password"
					placeholder="password"
					value={formData.password}
					onChange={handleChange}
					className=""
				/>
				<button type="submit" className="">
					Submit
				</button>
			</form>
		</div>
	);
};

export default Signup;
