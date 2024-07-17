import './App.css';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Home from './pages/Home';

function App() {
  return (
    <div className='h-screen'>
      <Navbar />
        <main className=''>
          <Home />
        </main>
      <Footer />
    </div>
  );
}

export default App;
