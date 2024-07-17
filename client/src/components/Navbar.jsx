import React from 'react'
import Search from './Search'

const Navbar = () => {
  return (
    <header className='bg-sky-200 flex justify-between items-center p-3'>
        <div className=''>
            <h1 className=''>Recipes App</h1>
        </div>
        <Search />
        <nav className='flex gap-2'>
            <ul className='flex justify-center items-center gap-3'>
                <li className=''><a href='#home' className=''>Home</a></li>
                <li className=''><a href='#home' className=''>Recipes</a></li>
                <li className=''><a href='#home' className=''>Favorites</a></li>
                <li className=''><a href='#home' className=''>About</a></li>
            </ul>
            <div className=''>
                <button className=''>Signup</button>
                <button className=''>Profile</button>
            </div>
        </nav>
    </header>
  )
}

export default Navbar