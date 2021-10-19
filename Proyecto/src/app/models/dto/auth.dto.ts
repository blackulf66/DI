export class AuthregisterDto {
    username : string
    email: string;
    contrasenya: string;
    code: string

    constructor() {
        this.username='';
        this.email = '';
        this.contrasenya = '';
        this.code='UDEMYANDROID';
    }
}