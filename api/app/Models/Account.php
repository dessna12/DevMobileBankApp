<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{

  use HasFactory;

  protected $fillable = [
    'name',
    'balance',
    'user_id',
    'iban'
  ];

  public function user()
  {
    return $this->belongsTo(User::class);
  }

  public function transactionsFrom()
  {
    return $this->hasMany(Transaction::class, 'from_account_id');
  }

  public function transactionsTo()
  {
    return $this->hasMany(Transaction::class, 'to_account_id');
  }

  public function transactions()
  {
    return $this->transactionsFrom()->union($this->transactionsTo());
  }

  public function recipients()
  {
    return $this->hasMany(Recipient::class);
  }
}
