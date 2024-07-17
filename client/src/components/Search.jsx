import React,{ useState } from 'react'
import { FaSearch } from "react-icons/fa";

const Search = () => {
    const [ search, setSearch ] = useState('')

    const handleSubmit = (event) => {
        event.preventDefault();
    };

    const handleChange = (event) => {
        setSearch(event.target.value)
    };

  return (
    <div className=''>
        <form onSubmit={handleSubmit} className='bg-zinc-500 flex justify-between items-center gap-2 w-full rounded-xl px-2 py-2 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500'>
            {/* <label htmlFor='search_label'></label> */}
            <input
                type='text'
                id='search_label'
                name='search'
                placeholder='Search recipes...'
                value={search}
                onChange={handleChange}
                className='bg-transparent text-white placeholder-white py-1 px-3 border-none rounded-lg focus:outline-none'
            />
            <span className='pr-2'>
                <FaSearch className='text-white'/>
            </span>
        </form>
    </div>
  )
}

export default Search