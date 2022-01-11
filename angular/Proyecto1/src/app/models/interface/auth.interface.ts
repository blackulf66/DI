export interface AuthregisterResponse {
    token: string;
    username: string;
    email: string;
    photoUrl: string;
    created: Date;
    active: boolean;
}