export interface FormSubmission {
    name: string;
    email: string;
    phone?: string;
    message: string;
}

export interface FormSubmissionResponse {
    success: boolean;
    data?: any;
    error?: string;
}