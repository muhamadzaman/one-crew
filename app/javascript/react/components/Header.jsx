import React from 'react';
import { Link } from 'react-router-dom';
import { logout, canCreate } from '../services/AuthenticationForApiService.js';
import history from '../history.js';

const Header = ({ isUserLoggedIn, setIsUserLoggedIn }) => {
  const onLogOut = () => {
    setIsUserLoggedIn(false);
    logout();
    history.push('/login')
  }

  return (
    <header>
      <nav className='navbar navbar-expand-md bg-light navbar-light '>
        <ul className='navbar-nav'>
          { isUserLoggedIn &&
            <li>
              <Link className='nav-link' to='/'>
                Jobs
              </Link>
            </li>
          }
        </ul>
        <ul className='navbar-nav navbar-collapse justify-content-end'>
          {!isUserLoggedIn && (
            <li>
              <Link className='nav-link' to=''>
                Login
              </Link>
            </li>
          )}
          {!isUserLoggedIn && (
            <li>
              <Link className='nav-link' to='/signup'>
                SignUp
              </Link>
            </li>
          )}
          {isUserLoggedIn && (
            <>
            {
              canCreate('client') && <li>
                <Link className='nav-link' to='/create-job'>
                  Create job
                </Link>
              </li>
            }
              <li>
                <Link className='nav-link' to='/login' onClick={onLogOut}>
                  Logout
                </Link>
              </li>
            </>
          )}
        </ul>
      </nav>
    </header>
  );
}

export default Header;
