import React from 'react';
import { Link } from 'react-router-dom';

export const NavBar = () => {
  return (
    <div>
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <a className="navbar-brand" href="/#">
          <h3>easyMed</h3>
        </a>
        <button
          className="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>

        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item active">
              <a className="nav-link" href="/#">
                Home <span className="sr-only">(current)</span>
              </a>
            </li>
            <li className="nav-item active">
              {/* <a className="nav-link" href="/#">
                Link
              </a> */}

              <a className="nav-link" href="/#">
                Home <span className="sr-only">(current)</span>
              </a>
            </li>
            {/* <li className="nav-item dropdown">
              <a
                className="nav-link dropdown-toggle"
                href="/#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                Dropdown
              </a>
              <div className="dropdown-menu" aria-labelledby="navbarDropdown">
                <a className="dropdown-item" href="/#">
                  Action
                </a>
                <a className="dropdown-item" href="/#">
                  Another action
                </a>
                <div className="dropdown-divider"></div>
                <a className="dropdown-item" href="/#">
                  Something else here
                </a>
              </div>
            </li> */}
            <li className="nav-item">
              <a
                className="nav-link disabled"
                href="/#"
                tabIndex="-1"
                aria-disabled="true"
              >
                Disabled
              </a>
            </li>
          </ul>
          <form className="form-inline my-2 my-lg-0">
            {/* <input
              className="form-control mr-sm-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            /> */}

            {/* FOLLOWING HAS THE WORKING ONE */}
            <Link to="/Login">
              <button
                className="btn btn-outline-success my-2 my-sm-0"
                type="button"
              >
                Login/SignUp
              </button>
            </Link>

            {/* THE TESTING ONE IS BELOW */}

            {/* <Link to={
              {
              pathname:"/Login",
              state:{

              }
              }
              }>
              
              <button
              className="btn btn-outline-success my-2 my-sm-0"
              type="button"
            >
              Login/SignUp
            </button></Link> */}
          </form>
        </div>
      </nav>
    </div>
  );
};
