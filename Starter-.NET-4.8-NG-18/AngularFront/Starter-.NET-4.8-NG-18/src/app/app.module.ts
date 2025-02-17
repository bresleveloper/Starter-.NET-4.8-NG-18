import { NgModule } from '@angular/core';
import { AppComponent } from './components/General/AppComponent/app.component';
import { ComponentsModule } from './modules/components.module';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { HomePageComponent } from './components/Pages/home-page/home-page.component';


@NgModule({
  declarations: [
  
    HomePageComponent
  ],
  imports: [
    ComponentsModule
  ],
  providers: [provideHttpClient(withInterceptorsFromDi())],
  bootstrap: [AppComponent]
})
export class AppModule { }
