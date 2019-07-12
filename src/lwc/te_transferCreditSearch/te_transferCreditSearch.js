import { LightningElement, track } from 'lwc';
import getInstitutionOptions from '@salesforce/apex/TE_TransferCreditSearchController.getInstitutionOptions';
import getCourseOptions from '@salesforce/apex/TE_TransferCreditSearchController.getCourseOptions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Te_transferCreditSearch extends LightningElement {
    @track institutionOptions;
    @track courseOptions;
    @track selectedInstitutionId;
    @track selectedCourseId;

    init() {
        getInstitutionOptions().then(result => {
            this.institutionOptions = result;
        }).catch( error => {
            if ( error.body.message) {
                this.showMessage( 'error', 'Error', error.body.message);
            } else {
                this.showMessage( 'error', 'Error', 'We encountered an unexpected error.');
            }
        });
    }

    connectedCallback() {
        this.init();
    }

    get isInstitutionSelected() {
        return this.selectedInstitutionId;
    }

    get courseStatusOptions() {
        return [
            { label: 'Complete', value: 'Completed' },
            { label: 'In Progress', value: 'In Progress' }
        ];
    }

    onInstitutionChange(event) {
        console.log('institution Id: ' + this.selectedInstitutionId);
        console.log('institution Id: ' + event.detail.value);
        this.selectedInstitutionId = event.detail.value;
        getCourseOptions({institutionId : event.detail.value}).then(result => {
            console.log('course options: ' + JSON.stringify(result));
            this.courseOptions = result;
        }).catch( error => {
            if ( error.body.message) {
                this.showMessage( 'error', 'Error', error.body.message);
            } else {
                this.showMessage( 'error', 'Error', 'We encountered an unexpected error.');
            }
        });
    }

    onCourseChange(event) {
        console.log('course Id: ' + event.detail.value);
        this.selectedCourseId = event.detail.value;
    }

    showMessage( msgType, msgTitle, msgBody) {
        var msgMode = 'dismissable';
        if ( msgType === 'error') {
            msgMode = 'pester';
        }
        const evt = new ShowToastEvent({
            title: msgTitle,
            message: msgBody,
            variant: msgType,
            mode: msgMode
        });
        this.dispatchEvent(evt);
    }
}