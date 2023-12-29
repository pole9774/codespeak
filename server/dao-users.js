'use strict';

/* Data Access Object (DAO) module for accessing users data */

const db = require('./db');
const crypto = require('crypto');

// This function returns user's information given its id.
exports.getUserById = (id) => {
    return new Promise((resolve, reject) => {
        const sql = 'SELECT * FROM users WHERE id=?';
        db.get(sql, [id], (err, row) => {
            if (err)
                reject(err);
            else if (row === undefined)
                resolve({ error: 'User not found.' });
            else {
                // By default, the local strategy looks for "username": 
                // for simplicity, instead of using "email", we create an object with that property.
                const user = { id: row.id, username: row.email, name: row.name, admin: row.admin }
                resolve(user);
            }
        });
    });
};

// This function is used at log-in time to verify username and password.
exports.getUser = (email, password) => {
    return new Promise((resolve, reject) => {
        const sql = 'SELECT * FROM users WHERE email=?';
        db.get(sql, [email], (err, row) => {
            if (err) {
                reject(err);
            } else if (row === undefined) {
                resolve(false);
            }
            else {
                const user = { id: row.id, username: row.email, name: row.name, admin: row.admin };

                // Check the hashes with an async call, this operation may be CPU-intensive (and we don't want to block the server)
                crypto.scrypt(password, row.salt, 64, function (err, hashedPassword) {
                    if (err) reject(err);
                    if (!crypto.timingSafeEqual(Buffer.from(row.hash, 'hex'), hashedPassword))
                        resolve(false);
                    else
                        resolve(user);
                });
            }
        });
    });
};
