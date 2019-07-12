import { LightningElement, track } from 'lwc';
import getInstitutionOptions from '@salesforce/apex/TE_TransferCreditSearchController.getInstitutionOptions';
import getCourseOptions from '@salesforce/apex/TE_TransferCreditSearchController.getCourseOptions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Te_transferCreditSearch extends LightningElement {
    @track institutionOptions;
    @track courseOptions;
    @track selectedInstitutionId;

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

    onInstitutionChange() {
        console.log('institution Id: ' + this.selectedInstitutionId);
        getCourseOptions({institutionId : this.selectedInstitutionId}).then(result => {
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