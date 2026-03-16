import pg from "pg"

export function connect() {
    return new pg.Pool({connectionString: process.env.DB_CONN})
}
// to use it 
// import {connect} from "@/utils"
const db = connect()