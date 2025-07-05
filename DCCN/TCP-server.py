# -*- coding: utf-8 -*-
"""
Created on Mon Mar 10 21:43:01 2025

@author: cheem
"""

import socket

def start_tcp_server():
    # Create a TCP/IP socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Allow the socket to reuse the address even if it's in a TIME_WAIT state
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    # Bind the socket to the address and port
    server_address = ('localhost', 65432)
    print('Starting up on {} port {}'.format(*server_address))
    server_socket.bind(server_address)

    # Listen for incoming connections
    server_socket.listen(1)

    while True:
        # Wait for a connection
        print('Waiting for a connection')
        connection, client_address = server_socket.accept()
        try:
            print('Connection from', client_address)

            # Receive the data in small chunks and retransmit it
            while True:
                data = connection.recv(16)
                print('Received {!r}'.format(data))
                if data:
                    # Check for shutdown message
                    if data.strip() == b'shutdown':
                        print('Shutting down the server...')
                        break  # Exit the inner loop
                    print('Sending data back to the client')
                    connection.sendall(data)
                else:
                    print('No more data from', client_address)
                    break
        finally:
            # Clean up the connection
            connection.close()

        # Check for shutdown message to exit the outer loop
        if data.strip() == b'shutdown':
            break
    # Close the server socket
    server_socket.close()
    print('Server shut down.')

# Start the TCP server
start_tcp_server()
