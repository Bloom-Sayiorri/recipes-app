import { NavLink } from 'react-router-dom';
// import Search from './Search';
import { CgProfile } from "react-icons/cg";
import { FaUserGear } from "react-icons/fa6";

const Navbar = () => {
  return (
    <header className='bg-sky-50 flex justify-between items-center p-3'>
        <div className=''>
            {/* <img src='' alt='Logo'/> */}
            <h1 className=''><NavLink to='/'>Recipes App</NavLink></h1>
        </div>
        {/* <Search /> */}
        <nav className='flex gap-2'>
            <div className='flex justify-center items-center gap-3'>
                <NavLink to='/' className=''>Home</NavLink>
                <NavLink to='/recipes' className=''>Recipes</NavLink>
                <NavLink to='/favorites' className=''>Favorites</NavLink>
                <NavLink to='/about' className=''>About</NavLink>
                <NavLink to='/signup' className=''>Signup</NavLink>
            </div>
            <div className=''>
                <button className='flex justify-center items-center border border-slate-500 rounded-md p-1 gap-4'>
                    <CgProfile />
                    <FaUserGear />
                </button>
            </div>
        </nav>
    </header>
  )
}

export default Navbar