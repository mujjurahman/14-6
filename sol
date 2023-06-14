function pfe_med_connect_insert_data($data) {
  $table_name = 'custom_table';

  try {
    $connection = Database::getConnection();
    foreach ($data as $row) {
      $connection->insert($table_name)
        ->fields([
          'Produit' => $row['Produit'],
          'Aire thérapeutique' => $row['Aire thérapeutique'],
          'Département' => $row['Département'],
          'RMR adresse email' => $row['RMR adresse email'],
          'Backup adresse email' => $row['Backup adresse email'],
        ])
        ->execute();
      \Drupal::messenger()->addMessage('Inserted row: ' . print_r($row, true));
    }
  }
  catch (DatabaseException $e) {
    \Drupal::messenger()->addError('Failed to insert data into the custom_table: ' . $e->getMessage());
  }
}
