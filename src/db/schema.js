const { pgTable, serial, varchar } = require('drizzle-orm/pg-core');

const subscribers = pgTable('subscribers', {
  id: serial('id').primaryKey(),
  email: varchar('email', { length: 254 }).notNull().unique(),
  emailAddress: varchar('email_address', { length: 254 }),
});

module.exports = { subscribers };
