import { Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Home from './pages/Home';
import Recipes from './pages/Recipes';
import Favorites from './pages/Favorites';
import Login from './pages/Login';
import Signup from './pages/Signup';
import About from './pages/About';


function App() {
  return (
    <div className='h-screen'>
      <Navbar />
        <main className=''>
          <Routes>
            <Route exact path='/' element={<Home />} />
            <Route path='/recipes' element={<Recipes />} />
            <Route path='/favorites' element={<Favorites />} />
            <Route path='/login' element={<Login />} />
            <Route path='/signup' element={<Signup />} />
            <Route path='/about' element={<About />} />
          </Routes>
        </main>
      <Footer />
    </div>
  );
}

export default App;
