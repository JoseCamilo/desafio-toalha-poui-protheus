import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { PoComboOption, PoNotificationService } from '@po-ui/ng-components';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit {
  public isLoadingSend = false;

  public formToalha: FormGroup = new FormGroup({
    nome: new FormControl('', [Validators.required, Validators.minLength(5)]),
    tamanho: new FormControl('', [Validators.required]),
    cor: new FormControl('', [Validators.required]),
    material: new FormControl('', [Validators.required]),
    peso: new FormControl('', [Validators.required]),
    estampa: new FormControl('', [Validators.required]),
  });

  public tamanhos: PoComboOption[] = [
    { value: 'Rosto' },
    { value: 'Mão' },
    { value: 'Banho' },
    { value: 'Piso' },
    { value: 'Praia' },
    { value: 'Mesa' },
  ];

  public cores: PoComboOption[] = [
    { value: 'Branco' },
    { value: 'Marrom' },
    { value: 'Verde' },
    { value: 'Vermelho' },
    { value: 'Azul' },
    { value: 'Preto' },
  ];

  public materiais: PoComboOption[] = [
    { value: 'Algodão' },
    { value: 'Poliester' },
    { value: 'Algodão Egípcio' },
    { value: 'Fio penteado' },
    { value: 'Organic' },
    { value: 'Frape' },
  ];

  public pesos: PoComboOption[] = [
    { value: '400 gsm' },
    { value: '500 gsm' },
    { value: '600 gsm' },
  ];

  public estampas: PoComboOption[] = [
    { value: 'Batman' },
    { value: 'Darth Vader' },
    { value: 'Einstein' },
    { value: 'Goku' },
    { value: 'Scooby' },
  ];

  constructor(
    private http: HttpClient,
    public poNotification: PoNotificationService
  ) {}

  ngOnInit() {}

  onSave() {
    this.isLoadingSend = true;

    this.http
      .post(
        `${environment.urlBackEnd}api/diatoalha/v1/toalha`,
        this.formToalha.value
      )
      .subscribe(() => {
        this.poNotification.success('Toalha salva com sucesso!');
        this.formToalha.reset();
        this.isLoadingSend = false;
      });
  }
}
