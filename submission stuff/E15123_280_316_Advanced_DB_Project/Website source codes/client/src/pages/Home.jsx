import React from 'react';
import { TheCarousel } from '../components/TheCarousel';

export const Home = () => {
  return (
    <div>
      <h2 className="text-center">This is the home page</h2>

      <blockquote className="blockquote text-center">
        <p className="mb-0">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
          posuere erat a ante.
        </p>
        <footer className="blockquote-footer">
          Someone famous in <cite title="Source Title">Source Title</cite>
        </footer>
      </blockquote>

      <TheCarousel />
      <br />
      <p className="blockquote text-center">
        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias at
        velit rerum sapiente veniam, vitae et earum maxime excepturi
        voluptatibus voluptas expedita temporibus provident aliquam asperiores,
        reprehenderit cumque exercitationem! Sint eius alias quidem aliquid
        doloremque, expedita repudiandae provident nisi fugiat dolores mollitia.
        Quasi accusantium voluptate consectetur corporis, similique obcaecati
        mollitia!
      </p>

      <div className="row text-center">
        <div className="col">
          <img src="http://lorempics.com/350x150/9B16AF/141614" alt="" />
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi
            libero eos a ipsam reprehenderit aliquid aliquam in reiciendis.
          </p>
        </div>

        <div className="col">
          <img src="http://lorempics.com/350x150/3A908B/141614" alt="" />
          <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit modi
            ipsa culpa pariatur ipsum sunt inventore nemo id vitae nesciunt.
          </p>
        </div>
      </div>
    </div>
  );
};
