export interface RequestTokenResponse {
    success:       boolean;
    expires_at:    string;
    request_token: string;
}

export interface SessionResponse {
    success:       boolean;
    session_id:    string;
}

export interface ListResponse {
    success:        boolean;
    status_code:    number;
    status_message: string;
    list_id:        number;
}

export interface CreateListResponse {
    name:        string;
    description: string;
    language:    string;
}
