import React,{ useState } from 'react'

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
        <form onSubmit={handleSubmit} className=''>
            {/* <label htmlFor='search_label'></label> */}
            <input
                type='text'
                id='search_label'
                name='search'
                placeholder='Search recipes...'
                value={search}
                onChange={handleChange}
                className=''
            />
            <button type='submit' className=''>Search</button>
        </form>
    </div>
  )
}

export default Search