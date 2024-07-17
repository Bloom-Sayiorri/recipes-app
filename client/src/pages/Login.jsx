import React, { useState } from 'react'

const Login = () => {
    const [ formData, setFormData ] = useState({
        email: '',
        password: '',
    });

    const handleSubmit = (event) => {
        event.preventDefault();
    };

    const handleChange = (event) => {
        setFormData(event.target.value)
    };

  return (
    <div className=''>
        <form onSubmit={handleSubmit}>
            <label htmlFor='email' className=''>Email</label>
            <input
                type='email'
                id='email'
                name='email'
                placeholder='Enter your email...'
                value={formData.email}
                onChange={handleChange}
                className=''
            />
            <label htmlFor='password' className=''>Password</label>
            <input
                type='password'
                id='password'
                name='password'
                placeholder='password'
                value={formData.password}
                onChange={handleChange}
                className=''
            />
            <button type='submit' className=''>Submit</button>
        </form>
    </div>
  )
}

export default Login