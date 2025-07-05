# -*- coding: utf-8 -*-
"""
Created on Mon Mar 10 21:45:31 2025

@author: cheem
"""

import socket

def start_tcp_client():
    # Create a TCP/IP socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Connect the socket to the server's port
    server_address = ('localhost', 65432)
    print('Connecting to {} port {}'.format(*server_address))
    client_socket.connect(server_address)

    try:
        # Send data
        message = b'This is the message. It will be repeated.'
        print('Sending {!r}'.format(message))
        client_socket.sendall(message)

        # Look for the response
        amount_received = 0
        amount_expected = len(message)

        while amount_received < amount_expected:
            data = client_socket.recv(16)
            amount_received += len(data)
            print('Received {!r}'.format(data))

        # Send shutdown message
        client_socket.sendall(b'shutdown')
        print('Shutdown message sent.')

    finally:
        print('Closing socket')
        client_socket.close()

# Start the TCP client
start_tcp_client()