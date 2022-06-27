import app from './app'
import {connectDB} from './config/mongodb';


async function main() {
    await connectDB();
    app.listen(app.get('port'),'192.168.1.10', ()=>{
        console.log('listening on port',app.get('port'));
    });
}


main();